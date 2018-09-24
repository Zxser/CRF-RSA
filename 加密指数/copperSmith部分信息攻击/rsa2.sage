"""
已知 n 和 p 的大部分比特，还原 p

    pbits - p 的长度（比特数）
    kbits - 未知的长度

"""

p4 = 0xf3a5f928e11c5901f9f4289e513f046748efb99d4f8e706e207a943e1d2c9df43feab38e20c2106d87167e5501ac41adfc4912732457103a4359e5b433da78f39ad6f206b8f170192aa0841feb501ce1
n = 0x7e7007c7c85788b9b77cda64c9b3f5d2a795fe1b1f8d3f120288a30a168c3ea932c7574700ff0f596c5ad04a703756aedc66b9b9e44911d55f0a72a1cc1a569cee02a84499cdb091b8471a8e6cc0ebca583dfd6fb8d5fecf32ff67d2ddeaaaaf9c71a10009b4218fc57743675f283d22734ac7ade2ca240772d11b5783755378f7c30988f41d4a9d62561ea6e5f2f21d3d44e8689e781d3f61356123929457d17b07a1d04741bf970afb590cd820dd12cf88f68b0e896388f433fd2adf3354353c9c56abb0cfea223387e6d0b2df10e450c621ac153e47369f888fdc0b39c842a5ddc6a11339862ccdb4be97a81445205fb8f8bde9daaad5d0dc2ea5bd3b8c43

pbits = 1024
kbits = pbits - p4.nbits()
print p4.nbits()
p4 = p4 << kbits

PR.<x> = PolynomialRing(Zmod(n))
f = x + p4
x0 = f.small_roots(X=2^kbits, beta=0.4)[0]
print "x: %s" %hex(int(x0))

p = p4+x0
print "p: ", hex(int(p))
assert n % p == 0
q = n/int(p)

print "q: ", hex(int(q))
