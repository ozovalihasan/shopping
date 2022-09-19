unless Rails.env.test? || Rails.env.development?
  Figaro.require_keys(
    "stripe_api_secret_key",
    "stripe_api_public_key",
    "stripe_webhook_secret_key",
)
end