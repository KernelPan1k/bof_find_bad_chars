BOF (find bad chars)
===

https://github.com/Tib3rius/Pentest-Cheatsheets/blob/master/exploits/buffer-overflows.rst

        bash find_badchars.sh ./sample1_immunity ./sample1_immunity
        !mona jmp -r esp -cpb "\x00\x51"
        !mona find -s 'jmp esp' -type instr -cm aslr=false,rebase=false,nx=false -cpb "\x00\x51"
