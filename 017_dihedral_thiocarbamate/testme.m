#! /usr/bin/octave -q

ivac1 = [25 20 38 32 33 34 35];
ivac2 = [11 10  9  8  6 13 18];
imono1 = [24  9 19 18 20 21 22];
imono2 = [33 32 31 29 30  1 35];
itetr1 = [33 22 25 23 26 27 15];
itetr2 = [28 14 13 10 12  9  1];

molvac = mol_readxyz("mol.xyz");
molmono = mol_readxyz("mono.xyz");
moltetr = mol_readxyz("tetr.xyz");

printf("| Dihedral | vac | mono | tetr |\n");
for i1 = 2:length(ivac1)-2
  dhvac  = abs(abs(mol_dihedral(molvac,ivac1(i1-1),ivac1(i1),ivac1(i1+1),ivac1(i1+2)))-180);
  dhmono = abs(abs(mol_dihedral(molmono,imono1(i1-1),imono1(i1),imono1(i1+1),imono1(i1+2)))-180);
  dhtetr = abs(abs(mol_dihedral(moltetr,itetr1(i1-1),itetr1(i1),itetr1(i1+1),itetr1(i1+2)))-180);
  printf("| %s-%s-%s-%s | %.1f |  %.1f |  %.1f |\n",...
        molvac.atname{ivac1(i1-1)},molvac.atname{ivac1(i1)},molvac.atname{ivac1(i1+1)},...
        molvac.atname{ivac1(i1+2)},dhvac,dhmono,dhtetr);
endfor
printf("| | | |\n");
for i2 = 2:length(ivac2)-2
  dhvac  = abs(abs(mol_dihedral(molvac,ivac2(i2-1),ivac2(i2),ivac2(i2+1),ivac2(i2+2)))-180);
  dhmono = abs(abs(mol_dihedral(molmono,imono2(i2-1),imono2(i2),imono2(i2+1),imono2(i2+2)))-180);
  dhtetr = abs(abs(mol_dihedral(moltetr,itetr2(i2-1),itetr2(i2),itetr2(i2+1),itetr2(i2+2)))-180);
  printf("| %s-%s-%s-%s | %.1f |  %.1f |  %.1f |\n",...
        molvac.atname{ivac2(i2-1)},molvac.atname{ivac2(i2)},molvac.atname{ivac2(i2+1)},...
        molvac.atname{ivac2(i2+2)},dhvac,dhmono,dhtetr);
endfor

