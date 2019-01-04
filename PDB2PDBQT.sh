#Author: Raghunadha Reddy Burri
#!/bin/bash

pdbFile="$1.pdb";
   
pdbqtFile="$1.pdbqt";

INFILE="-r $pdbFile";
     
OUTFILE="-o $pdbqtFile";

echo "Converting Protein from PDB to PDBQT..."
echo "Chacking and removing ligand..."

sed -i '/^HETATM/d' $pdbFile
 
MGLTOOLS_LOCATION="/home/raghu/anaconda3/lib/python2.7/site-packages";
    
RECEPTOR_SCRIPT="$MGLTOOLS_LOCATION/AutoDockTools/Utilities24/prepare_receptor4.py";
     
PARAMS="-A hydrogens_bonds -U nphs_lps_waters_nonstdres";
         
python2.7 $RECEPTOR_SCRIPT $INFILE $OUTFILE $PARAMS > /dev/null
