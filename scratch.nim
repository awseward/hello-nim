## read the first two lines of a text file that should contain numbers and tries
## to add them

#var
#  f: File
#if open(f, "numbers.txt"):
#  try:
#    var a = readLine(f)
#    var b = readLine(f)
#    # Following line gives:
#    #   scratch.nim(10, 23) Error: undeclared field: 'parseInt' for type system.TaintedString [declared in /Users/andrew/.asdf/installs/nim/1.2.0/lib/system.nim(1096, 8)]
#    #
#    # echo "sum: " & $(a.parseInt + b.parseInt)
#    echo "uhhh"
#  except OverflowError:
#    echo "overflow!"
#  except ValueError:
#    echo "could not convert string to integer"
#  except IOError:
#    echo "IO error!"
#  except:
#    echo "Unknown exception!"
#  finally:
#    close(f)

from strutils import parseInt

let x = try: parseInt("133a")
        except: -1
        finally: echo "hi"

echo x
