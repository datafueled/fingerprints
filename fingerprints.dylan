module: fingerprints
synopsis: Support for guessing the type of data in a string.
author: Bruce Mitchener
copyright: 2012, Data Fueled, LLC.

define class <fingerprint> (<object>)
  constant slot fingerprint-name :: <string>, required-init-keyword: name:;
  constant slot fingerprint-priority :: <integer> = 10, init-keyword: priority:;
  constant slot fingerprint-check :: <function>, required-init-keyword: check:;
  constant slot fingerprint-converter :: <function>, required-init-keyword: converter:;
end;

define constant <fingerprint-vector> = limited(<vector>, of: <fingerprint>);

define variable *fingerprints* :: <fingerprint-vector> = make(<fingerprint-vector>);

define function register-fingerprint (fingerprint :: <fingerprint>)
  *fingerprints* := add!(*fingerprints*, fingerprint);
end;

define macro fingerprint-definer
  { define fingerprint ?:name ?options:* end }
  => {
    define constant ?name = make(<fingerprint>, ?options);
    register-fingerprint(?name);
  }
end;

define function applicable-fingerprints (data :: <string>) => (fingerprints :: <fingerprint-vector>)
  choose(method(f) apply(fingerprint-check(f), data) end, *fingerprints*)
end;

define function convert-data-using-fingerprints (data :: <string>, fingerprints :: <fingerprint-vector>)
  if (empty?(fingerprints))
    data
  else
    let highest-priority :: <integer> = 0;
    let best-fingerprint = fingerprints[0];
    for (fingerprint in fingerprints)
      if (fingerprint-priority(fingerprint) > highest-priority)
        highest-priority := fingerprint-priority(fingerprint);
        best-fingerprint := fingerprint;
      end;
    end;
    apply(fingerprint-converter(best-fingerprint), data)
  end;
end;
