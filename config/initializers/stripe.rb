Rails.configuration.stripe = {
  publishable_key: "pk_test_hLUwZ4xcp7oJZ4hiBIeiX4Zk",
  secret_key:      "sk_test_qvwhcaptJX2Q0LWrvIJwsacR",
}
Stripe.api_key = \
  Rails.configuration.stripe[:secret_key]