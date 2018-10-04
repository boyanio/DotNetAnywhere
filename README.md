# DotNetAnywhere

DotNetAnywhere (DNA) is a small interpreted .NET CIL runtime. The original [code](https://github.com/chrisdunelm/DotNetAnywhere) has been adjusted by Steve Sanderson in his first versions of [Blazor](https://blazor.net). As he has now replaced DNA with Mono, I decided to fork his [latest DNA version](https://github.com/SteveSanderson/Blazor/tree/150aeeb0965bd4b7a24412d239d836016c6b4238) in order to adjust it for the needs of my demo project [The Wheel of WebAssembly](https://github.com/boyanio/wasm-wheel).

## Build

You would need Emscription 1.38.6 (or above). You can build the WebAssembly interpretter by running the following:

```
cd native
build.cmd
```

Two files will be generated in the `build` folder:
- `dna.wasm`
- `dna.js`