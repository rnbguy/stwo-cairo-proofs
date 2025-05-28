use alexandria_math::ed25519::verify_signature;

#[executable]
fn main(msg: Array<u8>, signature: [u256; 2], pub_key: u256) {
    assert(verify_signature(msg.span(), signature.span(), pub_key), 'invalid ed25519 signature');
}
