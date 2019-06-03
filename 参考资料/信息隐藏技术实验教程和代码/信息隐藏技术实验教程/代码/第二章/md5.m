function y = md5( a1, a2, a3 );
%MD5 verifies or generates a signature using the md5 algorithm.
%   MD5( M ) or MD5( M, 0 ) returns a message digest (signature)
%   from the matrix M. Currently the classes double and char are supported.
%
%   MD5( M, 1 )  generates the digest from a file. M must be a char 
%   array with the filename/filepath.
%
%   You can also give a signature as the last argument. In this case the
%   generated signature will be compared against the given. Returns 0 or 1.
%   Example: MD5( M, 1, '7dea362b3fac8e00956a4952a3d4f474' );
%
%   Md5 is actually not intended to work with large files (> 5 MB, see notes),
%   but is really comfortable to process directly matlab matrices.


%   Notes:     o There are more hashing routines, that could be implemented
%                eg. CRC, Adler, Haval, SHA, RMD...
%              o There's a problem with incremental file reading. As a workaround
%                I had to load the whole file into the memory. I tested with a 50 MB
%                file but though it worked well, I should fix this problem if there's
%                a need to process large files.
%              o For questions/comments/requests: support@treetron.ch.
%
%   Credits:   I used a freeware library with different hash algorithms. It's from 
%              Alex? (Ritlabs) and was downloaded from Torrys. Thanks a lot.
%              Built with Borland Delphi.
%
%   License:   You may use and distribute md5 free of charge for commercial and 
%              non-commercial use. Please don't modify this notice. Before using this
%              routine you have to accept the disclaimer of warranty below.
%
%   Warranty:  md5 is supplied as is. The author disclaims all warranties,
%              expressed or implied, including, without limitation, the warranties of
%              merchantability and of fitness for any purpose. The author assumes no
%              liability for damages, direct or consequential, which may result from the
%              use of md5.
%
%   Author:    Hans-Peter Suter
%   Revision:  0.7
%   Date:      25.7.2003
%
%   Copyright: Copyright (c) 2003, Treetron GmbH.
%              All rights reserved.

if nargin == 3
  b1 = a1; % matrix
  b2 = a2; % isFile
  b3 = a3; % signature
elseif nargin == 2
  if isa( a2, 'char' )
    b1 = a1;
    b2 = 0;
    b3 = a2;
  else
    b1 = a1;
    b2 = a2;
    b3 = [];
  end
elseif nargin == 1
  b1 = a1;
  b2 = 0;
  b3 = [];
else
  error( '3 arguments required' );
end;
  
% some checks
if ~isempty( b3 )  
  if ~isa( b3, 'char' )
    error( 'signature must be a char array' );
  end
  if length( b3 ) ~= 32
    error( 'signature must have 32 chars' );
  end
end
if ~(isa( b1, 'char' ) | isa( b1, 'double' ))
  error( 'value/filename must be a double or char array' );
end
if ~(b2 == 0 | b2 == 1)
  error( 'isFile must be 0 or 1' );
end

% call dll
if isempty( b3 )
  y = md5dll( b1, b2 );
else
  y = md5dll( b1, b2, b3 );
end;