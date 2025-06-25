# stwo-cairo-proofs

Install `cairo-prove` binary from
[starkware-libs/stwo-cairo](https://github.com/starkware-libs/stwo-cairo).

```bash
git clone https://github.com/starkware-libs/stwo-cairo
cd stwo-cairo/cairo-prove
RUSTFLAGS="-C target-cpu=native" cargo install --path .
```

## sha256

Test vector from https://www.di-mgt.com.au/sha_testvectors.html:

```
MESSAGE (length 3 bytes):
"abc" (0x616263)

HASH:
ba7816bf8f01cfea414140de5dae2223
b00361a396177a9cb410ff61f20015ad
```

```bash
# only execute
scarb execute -p sha256 --arguments-file packages/sha256/artifacts/abc.json
# stwo prover
scarb build -p sha256
cairo-prove prove target/dev/sha256.executable.json sha256_proof.json --arguments-file packages/sha256/artifacts/abc.json
# verify
cairo-prove verify sha256_proof.json
```

# ed25519

Test vector from https://datatracker.ietf.org/doc/html/rfc8032#page-25:

```
SECRET KEY:
c5aa8df43f9f837bedb7442f31dcb7b1
66d38535076f094b85ce3a2e0b4458f7

PUBLIC KEY:
fc51cd8e6218a1a38da47ed00230f058
0816ed13ba3303ac5deb911548908025

MESSAGE (length 2 bytes):
af82

SIGNATURE:
6291d657deec24024827e69c3abe01a3
0ce548a284743a445e3680d7db5ac3ac
18ff9b538d16f290ae67f760984dc659
4a7c15e9716ed28dc027beceea1ec40a
```

```bash
# only execute
scarb execute -p ed25519 --arguments-file packages/ed25519/artifacts/af82.json
# stwo prover
scarb build -p ed25519
cairo-prove prove target/dev/ed25519.executable.json ed25519_proof.json --arguments-file packages/ed25519/artifacts/af82.json
# verify
cairo-prove verify ed25519_proof.json
```

# garaga ed25519

```bash
# only execute
scarb execute -p ed25519_garaga --arguments-file packages/ed25519_garaga/artifacts/sample.json
# stwo prover
scarb build -p ed25519_garaga
cairo-prove prove target/dev/ed25519_garaga.executable.json ed25519_garaga_proof.json --arguments-file packages/ed25519_garaga/artifacts/sample.json
# verify
cairo-prove verify ed25519_garaga_proof.json
```
