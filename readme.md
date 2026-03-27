This repo is a joke. It is literally just for fun, and it completely ignores the comphrehensive approach to securedrop's threat model.

There is no key. I cannot unencrypt anything you send.

[Submit from my github page](adamciuris.github.io)

Only accepts files under 24 Kilobytes. 

If I can't `cat` whatever you send me, it is not getting opened.

https://docs.securedrop.org/en/stable/admin/installation/install.html


# Tor Hidden Service with Public Landing Page

This project runs a Tor hidden service and a public landing page that displays the onion address dynamically. The landing page is intended to be accessed via a Cloudflare Tunnel or any public URL, and instructs users to use Tor Browser to access the hidden service.

---

## Features

- Tor hidden service running in a Docker container
- Private web service (`nginx-tor`) serving content over `.onion`
- Public landing page (`nginx-not-tor`) that dynamically displays the onion address
- Uses `envsubst` to inject the onion address into `index.final.html` at runtime

---

## Usage

1. Clone the repository:

```bash
git clone <repo-url>
cd <repo-directory>