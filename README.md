# IANA TLD List

List of TLDs from [ICANN](https://www.icann.org/resources/pages/tlds-2012-02-25-en).

→ The list is **[here](https://github.com/skyzyx/iana-tlds/raw/main/tlds.json)** ←

## Usage

Grab the `tlds.json` file from this repo and use it however you want.

The file is re-generated weekly on Saturday at 9:41am UTC.

## Building without Developing

* Docker Engine + Docker Compose (both come with Docker Desktop)

```bash
docker compose up
```

## Local Development

* Go (run the generator)
* wget (download the data from IANA)
* make (facilitate simple build steps)
* Node.js (for running `markdownlint`)

View all available tasks:

```bash
make
```

Build your very own copy:

```bash
make build
```

## Authorship and Licensing

Code authored by Ryan Parman. The Go code, `Dockerfile`, and other "development-y" things are made available under the MIT License.

The TLD list itself (including the JSON-formatted `tlds.json` file) are made available under the terms listed in [IANA: Licensing Terms](https://www.iana.org/help/licensing-terms), which states either _public domain_ or the [Creative Commons CC0 1.0 Universal (CC0 1.0): Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/legalcode) license.

## Inspiration

This is a port of the generation bits of [`stephenmathieson/node-tlds`](https://github.com/stephenmathieson/node-tlds) to Go. The original package suffers from the issues discussed in “[npm & left-pad: Have We Forgotten How To Program?](https://www.davidhaney.io/npm-left-pad-have-we-forgotten-how-to-program/)”, including depending on multiple third-party packages that are utterly unnecessary — even in JavaScript/Node.js.

I wanted to provide something more reliable, with no dependencies outside the standard library.
