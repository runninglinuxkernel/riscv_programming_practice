
通过修改ld链接脚本文件，让run_on_vm()函数链接到0x81000000，不过这样导致benos.bin文件过大。
在编译mysbi时候，让payload过大，

mysbi.bin (addresses 0x0000000080000000 - 0x0000000080e04010) //mysbi超过了0x80200000.

所以这个实验需要把sbi_payload.S文件去掉，暂时不把benos.bin编译到mysbi中。
