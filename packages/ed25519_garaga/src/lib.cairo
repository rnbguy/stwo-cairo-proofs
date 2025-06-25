use garaga::signatures::eddsa_25519::{EdDSASignatureWithHint, is_valid_eddsa_signature};

#[executable]
fn main(input: Array<EdDSASignatureWithHint>) {
    let mut span = input.span();
    while let Some(signature) = span.pop_front() {
        assert(is_valid_eddsa_signature(signature.clone()), 'invalid garaga ed25519');
    }
}
