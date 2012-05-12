This is our modified Cluebot NG version. We've added a number of features to it, the actual implementation of which are in Python and can be found at https://github.com/omoll/wikivandalism

Training and Classifying
====

Make sure the wikivandalism folder is in the same directory as your cluebotng checkout (ie, relative to the cluebotng folder it'll be ../wikivandalism). You can do this via:

    cd ..
    git clone git@github.com:omoll/wikivandalism.git

Now cd back to the cluebotng directory, and if it's your first time using it, run:

    make
    ./util/train_bayes.sh

Then (or on subsequent runs), you can just run the single script:

    ./runall.sh

Data about the run will be in trialreport.

Adding new features
====

First add a new feature via the procedure described at https://github.com/omoll/wikivandalism/blob/master/README.md . Then generate data by running:

    ./dumpdata.py article_is_biography

(Substitute article_is_biography for the feature name). Now add to src/standardprocessors.hpp:

    boolFeatures.push_back("article_is_biography");

Now add to util/make_ann_input_expressions.sh:

    boolean article_is_biography

Now rebuild with make, and retrain with ./runall.sh

Should you need to later disable a feature, just uncomment it in util/make_ann_input_expressions.sh, and rerun ./runall.sh

What follows is the original readme file for Cluebot NG
====

A running Cluebot-NG install has two main components - the core and the interface to Wikipedia.

Core
====

The core is written in C++ and listens on a TCP socket for communication from the Wikipedia interface.  It can be compiled by typing 'make', but has a number of prerequisites.  For several of these prerequisites, it uses relatively new features, so the version is important.  If you have all of these prerequisites but still get compile errors, try installing the latest version.

Prerequisites:

* Expat 2.0.1, http://expat.sourceforge.net/
* MathEval 1.1.7, http://www.gnu.org/software/libmatheval/
* Berkeley DB 4.x C++ Bindings, http://www.oracle.com/technetwork/database/berkeleydb/
* libiconv 1.13, http://www.gnu.org/software/libiconv/
* libfann 2.1.0, http://leenissen.dk/fann/
* libconfig 1.4.5 C++ Bindings, http://www.hyperrealm.com/libconfig/
* Boost 1.40.0, http://www.boost.org/

Interface to Wikipedia
======================

The interface to Wikipedia is written in PHP and requires a PHP interpreter.
=======
cluebotng
=========

cluebotng source code

