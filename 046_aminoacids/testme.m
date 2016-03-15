#! /usr/bin/octave -q

# Essential amino acids for the standard human being /they must be
# obtained from diet:
aminoacids = {'His','Ile','Leu','Lys','meT','Phe','Thr','Trp','Val','Ala','Arg','Asn','Asp','Cys','Glu','Gln','Gly','Pro','Sec','Ser','Tyr'};

smiles = {
     'O=C(O)[C@@H](N)Cc1c[nH]cn1'
   , 'CC[C@H](C)[C@@H](C(=O)O)N'
   , 'CC(C)C[C@@H](C(=O)O)N'
   , 'C(CCN)CC(C(=O)O)N'
   , 'CSCCC(C(=O)O)N'
   , 'C1=CC=C(C=C1)CC(C(=O)O)N'
   , 'C[C@H]([C@@H](C(=O)O)N)O'
   , 'c1ccc2c(c1)c(c[nH]2)C[C@@H](C(=O)O)N'
   , 'CC(C)[C@@H](C(=O)O)N'
   , 'O=C(O)[C@@H](N)C'
   , 'NC(CCC[nH]:c(:[nH]):[nH2])c(:[o]):[oH]'
   , 'C([C@@H](C(=O)O)N)C(=O)N'
   , 'C(C(C(=O)O)N)C(=O)O'
   , 'C(C(C(=O)O)N)S'
   , 'C(CC(=O)O)C(C(=O)O)N'
   , 'O=C(N)CCC(N)C(=O)O'
   , 'C(C(=O)O)N'
   , 'C1CC(NC1)C(=O)O'
   , 'O=C(O)[C@@H](N)C[SeH]'
   , 'C([C@@H](C(=O)O)N)O'
   , 'N[C@@H](Cc1ccc(O)cc1)C(O)=O'
   };

for i = 1:length(aminoacids)
  aa = aminoacids{i};
  code = smiles{i};
  mol_smiles2xyz(code,aa,0);
  printf("%s --> %s\n", aa, code)
  file = sprintf ("%s.xyz", aa);
  #
  # Create the plot
  rep = representation_();
  mol = mol_readxyz(file);
  rep = mol_ball(mol);
  rep = mol_stick(mol,rep);
  rep = rep_setbgcolor(rep,[1,1,1]);
  [isplanar,normal_vector] = mol_isplanar(mol);
  if (isplanar)
     rep = rep_setdefaultscene_tessel(rep,[0,0,45]);
  else
     rep = rep_setdefaultscene_tessel(rep,[40,20,45]);
  end
  rep_write_pov(rep,sprintf("%s.pov",aa));
  rep_write_off(rep,sprintf("%s.off",aa));
  rep_write_obj(rep,sprintf("%s.obj",aa));
  run_povray(aa);
  printf("%s(pov,off,obj,png) created", aa);
end
