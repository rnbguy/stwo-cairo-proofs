#[feature("deprecated-sha256")]
use alexandria_math::sha256::sha256;

#[executable]
fn main(msg: Array<u8>, expected_hash: u256) {
    let hash_bytes = sha256(msg);
    let mut span = hash_bytes.span();

    let mut actual_hash: u256 = 0;

    while let Some(byte) = span.pop_front() {
        actual_hash *= 0x1_00; // 2**8
        actual_hash += (*byte).into();
    }

    assert(actual_hash == expected_hash, 'invalid sha256 hash');
}
