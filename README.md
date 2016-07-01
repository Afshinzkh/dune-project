# dune-project
This Project installs a dune project which solves the nonlinear heat equation using the dune-pdelab Module.

#Dependencies
-- The definite dependencies are:<br />
*  gcc >= 4.9 <br />
*  cmake >= 3.2 <br />
*  pkg.config <br />
*  MPI (for parallel Calculations) <br />


-- if the software didn't install properly the following dependencies might help: <br />
    blas, lapack, gmp, superlu <br />
    for all these packages you might also need the -dev packages as well. <br />

-- for the visualization part, paraview is recommended.<br />

#Installation
The file install.sh is basically doing all the job, <br />
The latest version of all the requiered modules will be downloded from the git repository. There might be slight chance that the versions of 
git modules will not fit the dune-heat module. in this case you have to download version 2.4 from dune-project manually.
-- first you need to have an internet connection since it needs to download
the external dependencies.<br />
-- the installation will ask you for an absolute path for the installation of dune,<br />
	it should be something like: /home/username/duneInstallation<br />
-- after installtion, the executable file is in: debug-build/dune-heat/src/

#Documentation
-- The mathematics behind is available at the dune-documents folder, these are some parts of the dune-pdelab course held in march2016
at iwr. I just add the related documents to dune-heat, although the whole course is not available here. <br />
-- Tutorial03.pdf describes the heat equation but since it is kind of dependant on tutorial00 and tutorial01 I added those files which might helpful.<br />

#More
-- if you want to get the whole course it is available online. <br />
	you can follow the instructions in dune-documents/PDELabTutorialsInstructions.txt <br />

-- for more questions you can contact the dune-pdelab community in the [mailing list](http://lists.dune-project.org/mailman/listinfo/dune-pdelab)

