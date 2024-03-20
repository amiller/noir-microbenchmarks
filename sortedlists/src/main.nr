use dep::std::hash::poseidon2::Poseidon2;

global N = ${CIRCUIT_SIZE};

fn main(x: [u64; N]) -> pub (Field, Field) {
    let xHash = Poseidon2::hash(x.map(|xi:u64| xi as Field), x.len());
    let y = x.sort();
    let yHash = Poseidon2::hash(y.map(|yi:u64| yi as Field), y.len());    
    (xHash, yHash)
}

#[test]
fn test_main() {
    let mut x : [u64;N] = [0; N];
    for i in 0..N {
	x[i] = i;
    }
    let (xHash, yHash) = main(x);
    assert(xHash != yHash);

    // Uncomment to make test fail
    // main(1, 1);
}
