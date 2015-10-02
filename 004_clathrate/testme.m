#! /usr/bin/octave -q

# read and extract a 11-ang-radius sphere around the
# position of the methane.
cr = cr_read_espresso("clathrate.scf.out");
mol = cr_spherebox(cr,[0 0 0.25],11);

# keep only the hydrogens that are directly attached to some O 
trim = [];
for i = 1:length(mol.atnumber)
  if (mol.atnumber(i) == 1)
    for j = 1:length(mol.atnumber)
      if (mol.atnumber(j) > 1 && (norm(mol.atxyz(:,i)-mol.atxyz(:,j)) < 1.2))
        trim = [trim i];
        break
      endif
    endfor
  else
    trim = [trim i];
  endif
endfor
mol = mol_getfragment(mol,trim);


# create a reprsentation where the clathrate cage is evident,
# with covalent bonds in blue and hydrogen bonds in green.
rep = mol_ball(mol,:,:,:,-0.4);
rep = mol_stick(mol,rep,"H","O",[0.9 1.1]);
rep = mol_stick(mol,rep,"H","O",[1.3 1.8],:,0.02,[0 0 255]);
rep = mol_stick(mol,rep,"H","C",[0.8 1.2]);
rep = mol_polyhedron(mol,mol,rep,"C","O",[0 10],[255 215 100 115 115],[],"metal1");
# rep = rep_setdefaultscene_view3dscene(rep,[-10.05 -11.46 9.02],[0.64 0.67 -0.37],[0.24 0.29 0.93],:,1.5);
rep = rep_setdefaultscene_tessel(rep,[75 15 45]);

# geomview output
rep_write_off(rep,"clathrate.off");
rep_write_obj(rep,"clathrate.obj");
rep_write_pov(rep,"clathrate.pov");
run_povray("clathrate");

