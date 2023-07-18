CREATE OR REPLACE FUNCTION vector_sign_f64_helper AS WASM
FROM BASE64 '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dgBvdXQAaW50AHJldABzaXplX3QAZXh0ZW5zaW9uX2xpc3RfdThfdAB1aW50OF90AGludDMyX3QAcHRyAHVuc2lnbmVkIGNoYXIAaW4Ab3JnX2FsaWduAGxlbgBpAGFyZwB1bnNpZ25lZCBsb25nAG5ld19zaXplAG9yaWdfc2l6ZQBkb3VibGUAY2Fub25pY2FsX2FiaV9mcmVlAGV4dGVuc2lvbl9saXN0X3U4X2ZyZWUAcGFja2VkAGNhbm9uaWNhbF9hYmlfcmVhbGxvYwBleHRlbnNpb24uYwBleHRlbnNpb25faW1wbC5jAF9fQVJSQVlfU0laRV9UWVBFX18AUkVUX0FSRUEAX193YXNtX2V4cG9ydF9leHRlbnNpb25fdmVjdG9yX3NpZ25fZjY0AC9ob21lL3NpZGRoYXJ0aC9EZXNrdG9wL3NzYS92ZWN0b3Jfc2lnbl9mNjQAYXJnMgBhcmcwAGNsYW5nIHZlcnNpb24gMTYuMC4wAAD5AQRuYW1lAd0BDwARX193YXNtX2NhbGxfY3RvcnMBC19pbml0aWFsaXplAhVjYW5vbmljYWxfYWJpX3JlYWxsb2MDEmNhbm9uaWNhbF9hYmlfZnJlZQQnX193YXNtX2V4cG9ydF9leHRlbnNpb25fdmVjdG9yX3NpZ25fZjY0BRlleHRlbnNpb25fdmVjdG9yX3NpZ25fZjY0BgZtYWxsb2MHCGRsbWFsbG9jCARmcmVlCQZkbGZyZWUKB3JlYWxsb2MLDWRpc3Bvc2VfY2h1bmsMBWFib3J0DQRzYnJrDgZtZW1jcHkHEgEAD19fc3RhY2tfcG9pbnRlcgA1CXByb2R1Y2VycwIIbGFuZ3VhZ2UBA0MxMQAMcHJvY2Vzc2VkLWJ5AQVjbGFuZwYxNi4wLjAAOQ90YXJnZXRfZmVhdHVyZXMDKwtidWxrLW1lbW9yeSsPbXV0YWJsZS1nbG9iYWxzKwhzaWduLWV4dA=='
WITH WIT FROM BASE64 'dmVjdG9yLXNpZ24tZjY0OiBmdW5jKHBhY2tlZDogbGlzdDx1OD4pIC0+IGxpc3Q8dTg+Cgo='
USING EXPORT 'vector-sign-f64';

DELIMITER //
CREATE OR REPLACE FUNCTION vector_sign_f64(x LONGBLOB NULL)
RETURNS LONGBLOB NULL AS
BEGIN
    IF x IS NULL THEN
        RETURN NULL;
    END IF;
    RETURN vector_sign_f64_helper(x);
END //
DELIMITER ;
