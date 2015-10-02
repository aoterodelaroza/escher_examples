#! /usr/bin/octave -q

mol = mol_readxyz("tube.xyz");
smol = mol_burst(mol);
if (length(unique(smol{1}.atnumber)) == 2)
   tube = smol{1};
   rest = smol{2};
else
   tube = smol{2};
   rest = smol{1};
endif
clear mol smol

rep = representation_();
rep = mol_ball(rest,rep);
rep = mol_stick(rest,rep);
rep = mol_stick(tube,rep,:,:,:,:,0.1);
rep = rep_setdefaultscene_view3dscene(rep,[-6.30 -5.62 -39.06],[0.16 0.14 0.98],[0.30 -0.95 0.09]);
rep_write_obj(rep,"tube.obj");
rep_write_pov(rep,"tube.pov");
run_povray("tube");

