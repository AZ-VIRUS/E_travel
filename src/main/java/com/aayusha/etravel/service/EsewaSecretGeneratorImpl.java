package com.aayusha.etravel.service;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Service;

@Service
public class EsewaSecretGeneratorImpl implements EsewaSecretGenerator {

    @Override
    public String generateSignature(String key, String message) {
        try {
            Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
            sha256_HMAC.init(secretKey);

            byte[] hashBytes = sha256_HMAC.doFinal(message.getBytes(StandardCharsets.UTF_8));
            String hash = Base64.getEncoder().encodeToString(hashBytes);

            System.out.println(hash);
            return hash;

        } catch (Exception e) {
            throw new RuntimeException("Error generating eSewa signature", e);
        }
    }
}
