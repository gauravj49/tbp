#!/usr/bin/python
"""
***********************************************
- PROGRAM: sum.py
- CONTACT: Gaurav Jain(gaurav.jain@tum.de)
***********************************************
"""
#print (__doc__)

# Built in modules
import argparse
import textwrap
import os.path
import sys


################ USER CONFIGURATION ###################
#######################################################

def main():
    # Get input options
    args        = check_options()
    input_var1  = args.input_var1
    input_var2  = args.input_var2

    # Comput the sum
    var3 = float(input_var1) + float(input_var2)

    # Print the sum
    print(var3)
    
################ USER DEFINED FUNCTIONS ###################

def check_options():
    ''' Checks the options to the program '''

    # Create parser object
    parser = argparse.ArgumentParser(add_help=True,
        formatter_class=argparse.RawTextHelpFormatter,
        epilog=textwrap.dedent('''\
        ----------------- SAMPLE USAGE ------------------
        - python scripts/sum.py -v1=3 -v2=9.2
        -------------------------------------------------
        CONTACT: 
        	Gaurav Jain
        	gaurav.jain@dzne.de
        -------------------------------------------------
        '''))

    # Add arguments 
    parser.add_argument("-v1", metavar="--invar1", help="*Input variable 1", dest="input_var1", type=float, required=True)
    parser.add_argument("-v2", metavar="--invar2", help="*Input variable 2", dest="input_var2", type=float, required=True)

    # Print the help message only if no arguments are supplied
    if len(sys.argv)==1:
        parser.print_help()
        sys.exit(1)

    # Parse command line with parse_args and store it in an object
    args = parser.parse_args()
    return args

# main function
if __name__=="__main__":
      main()
