module: dylan-user

define library fingerprints-test-suite
  use common-dylan;
  use io;
  use fingerprints;
  use testworks;

  export fingerprints-test-suite;
end library;

define module fingerprints-test-suite
  use common-dylan, exclude: { format-to-string };
  use format;
  use fingerprints;
  use testworks;

  export fingerprints-test-suite;
end module;
