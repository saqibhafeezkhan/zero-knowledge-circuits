const snarkjs = require("snarkjs");
const fs = require("fs");

async function run() {
    var input = {
        "age":20,
        "ageLimit":18
    }
    const { proof, publicSignals } = await snarkjs.plonk.fullProve(input, "./../circuits/ageCheck/ageCheck_js/ageCheck.wasm", "../circuits/ageCheck/circuit_final.zkey");
    console.log(proof)
    console.log(publicSignals)
    console.log("Proof: ");
    console.log(JSON.stringify(proof, null, 1));

    const vKey = JSON.parse(fs.readFileSync("../circuits/ageCheck/verification_key.json"));

    const res = await snarkjs.plonk.verify(vKey, ["20","18"], proof);

    if (res === true) {
        console.log("Verification OK");
    } else {
        console.log("Invalid proof");
    }

}

run().then(() => {
    process.exit(0);
});