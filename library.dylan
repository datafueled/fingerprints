module: dylan-user

define library fingerprints
  use common-dylan;

  export fingerprints;
end library;

define module fingerprints
  use common-dylan;

  export applicable-fingerprints, fingerprint-definer,
    fingerprint-name, convert-data-using-fingerprints;
end module;
