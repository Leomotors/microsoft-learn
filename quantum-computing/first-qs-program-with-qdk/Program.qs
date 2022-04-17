namespace first_qs_program_with_qdk {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;

    operation RNGesus() : Result {
        use q = Qubit();
        H(q);
        return M(q);
    }

    operation GetRandomNumberInRange(min : Int, max : Int) : Int {
        let range = max - min;
        mutable output = 0;
        repeat {
            mutable bits = [];
            for idxBit in 1..BitSizeI(range) {
                set bits += [RNGesus()];
            }
            set output = ResultArrayAsInt(bits);
        }
        until (output <= range);
        return output + min;
    }

    @EntryPoint()
    operation SampleRandomNumber() : Int {
        let min = 112;
        let max = 69420;
        Message($"Sampling a random number between {min} and {max}:");
        return GetRandomNumberInRange(min, max);
    }
}
