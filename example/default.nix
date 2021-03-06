{ system ? builtins.currentSystem # TODO: Get rid of this system cruft
, iosSdkVersion ? "10.2"
}:
with import ./.obelisk/impl { inherit system iosSdkVersion; };
project ./. ({ ... }: {
  android.applicationId = "systems.obsidian.obelisk.examples.minimal";
  android.displayName = "Obelisk Minimal Example";
  ios.bundleIdentifier = "systems.obsidian.obelisk.examples.minimal";
  ios.bundleName = "Obelisk Minimal Example";
  overrides = self: super: {
      reflex-dom-contrib = 
        super.callCabal2nix "reflex-dom-contrib" (import ../nix/reflex-dom-contrib.nix) {};
      reflex-dom-nested-routing = 
        super.callCabal2nix "reflex-dom-nested-routing" (import ../nix/reflex-dom-nested-routing.nix) {};
    reflex-dom-storage = 
        super.callCabal2nix "reflex-dom-storage" ../. {};
  };
})
