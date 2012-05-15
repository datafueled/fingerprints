module: fingerprints
synopsis: Support for guessing the type of data in a string.
author: Bruce Mitchener
copyright: 2012, Data Fueled, LLC.

define fingerprint $numeric-fingerprint
  name: "base/numeric",
  check: method (data :: <string>) #f end,
  converter: method (data :: <string>) data end
end;

define fingerprint $integer-fingerprint
  name: "base/integer"
  check: method (data :: <string>) #f end,
  converter: method (data :: <string>) data end
end;

define fingerprint $float-fingerprint
  name: "base/float"
  check: method (data :: <string>) #f end,
  converter: method (data :: <string>) data end
end;
