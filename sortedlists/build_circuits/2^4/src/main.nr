use dep::std::hash::poseidon2::Poseidon2;

global N = 16;

fn main(x: Field) -> pub (Field, Field) {

    let y = x * x;
    
    let xHash = Poseidon2::hash([x], 1);    
    let yHash = Poseidon2::hash([y], 1);
    (xHash, yHash)
}

#[test]
fn test_main() {
    let (xHash, yHash) = main(2);
    assert(xHash != yHash);

    // Uncomment to make test fail
    // main(1, 1);
}
