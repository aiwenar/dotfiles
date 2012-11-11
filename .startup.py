try:
  import readline
except ImportError:
  print ( 'Module readline no available.' )
else:
  import rlcompleter
  readline.parse_and_bind ( 'tab: complete' )

def doc ( obj ):
  print ( obj.__doc__ )
