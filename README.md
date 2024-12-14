# **Downlib**

### **Downlib** is a library for
### downloading, copy and move files and dirs
### using various utilities

## Help

```sh
make help
```

## Examples

- ### Download with rsync

```sh
downlib_rsync "user@remote:/path/to/dir" "/local/path" "-avz" "your_pass"
```

- ### Download with aria2c

```sh
downlib_aria2c https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.4.tar.xz out/dl
```

- ### Download with wget (use args)

```sh
downlib_wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.4.tar.xz out/dl "-q"
```

## License
Downlib is released under the MIT License. See [LICENSE](LICENSE.md) for more details
