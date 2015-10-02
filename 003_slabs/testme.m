#! /usr/bin/octave -q

## hexgaonal BN
cr = cr_read_espresso("hbn.scf.out");
mol = cr_crystalbox(cr,[-0.05 -0.05 -0.05],[3.05 3.05 0.20]);

rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);

rep0 = rep_setdefaultscene_tessel(rep,:,"direct-noshadow");
rep_write_pov(rep0,"hbn1.pov");
run_povray("hbn1");

rep0 = rep_setdefaultscene_tessel(rep,[60 90 45],"direct-noshadow",1.5);
rep_write_pov(rep0,"hbn2.pov");
run_povray("hbn2");

## For graphite I'll just use BN since the structures are so similar
## The lighting needs to be a little different because of the black balls 
for i = 1:mol.nat
  mol.atname{i} = "C";
  mol.atnumber(i) = 6;
  mol.atmass(i) = 12.0107;
endfor

rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep);

rep0 = rep_setdefaultscene_tessel(rep,:,"tessel",1.5);
rep_write_pov(rep0,"c1.pov");
run_povray("c1");

rep0 = rep_setdefaultscene_tessel(rep,[60 90 45],"tessel",1.5);
rep_write_pov(rep0,"c2.pov");
run_povray("c2");

## MoS2
cr = cr_read_espresso("mos2.scf.out");
mol = cr_crystalbox(cr,[-0.05 -0.05 -0.05],[3.05 3.05 0.30]);

rep = representation_();
rep = mol_ball(mol,rep);
rep = mol_stick(mol,rep,"Mo","S");

rep0 = rep_setdefaultscene_tessel(rep,:,"direct-noshadow");
rep_write_pov(rep0,"mos21.pov");
run_povray("mos21");

rep0 = rep_setdefaultscene_tessel(rep,[80 90 45],"direct-noshadow",1.5);
rep_write_pov(rep0,"mos22.pov");
run_povray("mos22");
