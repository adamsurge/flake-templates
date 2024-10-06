# Bevy Game Engine Template

## Getting Started

Run:

```sh
cargo init
cargo add bevy -F dynamic_linking # faster builds
```

Add the following to `Cargo.toml` for performance optimisations:

```toml
# Enable a small amount of optimization in the dev profile.
[profile.dev]
opt-level = 1

# Enable a large amount of optimization in the dev profile for dependencies.
[profile.dev.package."*"]
opt-level = 3
```
