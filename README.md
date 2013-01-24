# Chef cookbook for omnigollum-site

## Usage (for chef-solo)

### 1. Install chef and some libraries

```
# curl -L https://gist.github.com/raw/4597441/setup.sh | bash
```

### 2. Copy and edit node.json to adjust your server environment.

```
# cp /tmp/node-example.json /tmp/node.json
```

### 3. Run chef-solo

```
 chef-solo -c /tmp/solo.rb -j /tmp/node.json
```
