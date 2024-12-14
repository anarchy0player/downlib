# **Downlib**

### **Downlib** is a library for downloading
### files using various utilities

## Help

```sh
make help
```

## Examples

- ### Download with aria2c

```sh
downlib_dl aria2c https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.4.tar.xz
```

- ### Download with wget (use args)

```sh
downlib_dl wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.4.tar.xz out/dl "-q"
```

## License
Downlib is released under the MIT License. See [LICENSE](LICENSE.md) for more details
