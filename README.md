<div align="center">
  <img src="https://github.com/CachyOS/calamares-config/blob/grub-3.2/etc/calamares/branding/cachyos/logo.png" width="64" alt="CachyOS logo"></img>
  <br/>
  <h1 align="center">CachyOS</h1>
  <p align="center">CachyOS Docker Images</p>
</div>


## Images

| Image | Contents |
|---|---|
| `cachyos/cachyos` | CachyOS base, generic x86-64 packages |
| `cachyos/cachyos-v3` | CachyOS with x86-64-v3 optimized packages |
| `cachyos/cachyos-v4` | CachyOS with x86-64-v4 optimized packages |
| `cachyos/distrobox` | `cachyos-v3` for [distrobox](https://distrobox.it/): its dependencies, fish, zsh, base-devel and paru preinstalled |

### distrobox

```sh
distrobox create --name cachyos --image docker.io/cachyos/distrobox:latest
distrobox enter cachyos
```

Add `--nvidia` on hosts with the NVIDIA driver to use it inside the box.
The packages distrobox would install on the first start are already in the
image, so `distrobox enter` starts the box right away. Update the box from
inside with `sudo pacman -Syu`, or all boxes with `distrobox upgrade --all`.
