# dune-project
This Project installs a dune project which solves the nonlinear heat equation using the dune-pdelab Module.

#Dependencies
-- The definite dependencies are:
	1) gcc >= 4.9
	2) cmake >= 3.2
	3) pkg.config
	4) MPI (for parallel Calculations)
-- if the software didn't install properly the following dependencies might help:
	blas, lapack, gmp, superlu
   for all these packages you might also need the -dev packages as well.

-- for the visualization part, paraview is recommended.

#Installation
The file install.sh is basically doing all the job, 
-- first you need to have an internet connection since it needs to download
the external dependencies.
-- the installation will ask you for an absolute path for the installation of dune,
	it should be something like: /home/username/duneInstallation
-- after installtion, the executable file is in: debug-build/dune-heat/src/

#Documentation
-- The mathematics behind is available at the dune-documents folder, these are some parts of the dune-pdelab course held in march2016
at iwr. I just add the related documents to dune-heat, although the whole course is not available here.
-- Tutorial03.pdf describes the heat equation but since it is kind of dependant on tutorial00 and tutorial01 I added those files which might helpful.

#More
-- if you want to get the whole course it is available online.
	you can follow the instructions in dune-documents/PDELabTutorialsInstructions.txt

-- for more questions you can contact the dune-pdelab community in the following mailing list:
	http://lists.dune-project.org/mailman/listinfo/dune-pdelab

