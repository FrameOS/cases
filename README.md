# FrameOS parametric cases

## Mark 1

- Parametric design - change any dimension and regenerate
- Two part design where the lid screws to the body with heat set inserts
- Custom number of screws on any edge
- Kickstand for tabletop usage
- Large 13" frames optimized for vertical printing without supports

## Running locally:

Run `npm start [model]`. Where `model` can be `7in3e`, `13in3e`, or anything else from the `models/` folder. PRs welcome!

Open the generated `dist/out.scad` in [OpenSCAD](https://openscad.org/), or in [MakerWorld's MarkerLab's Parametric Model Marker](https://makerworld.com/en/makerlab/parametricModelMaker) (say that 3 times), and print the STL.

### Waveshare 7.3" E Spectra 6 color

Features a kickstand. The case depth for electronics is 12mm.

- Download: [stl](https://github.com/FrameOS/cases/blob/main/exports/mark1/7in3e.stl), [3mf](https://github.com/FrameOS/cases/blob/main/exports/mark1/7in3e.3mf)

![7in3e](./images/mark1/7in3e-model.png)

### Waveshare 13.3" E Spectra 6 color

**Note:** beware of shrinkage when printing vertically! Scale your model up by 1mm before printing to combat this!

The case depth for electronics is 10mm.

- Download: [stl](https://github.com/FrameOS/cases/blob/main/exports/mark1/13in3e-upright.stl)

![13in3e](./images/mark1/13in3e-upright.png)


### Inspiration

This model was inspired by [this case](https://www.printables.com/model/76756-waveshare-75-screen-case) and [its remix](https://www.printables.com/model/82001-waveshare-75-screen-case-remix), yet is reimplemented from scratch.
