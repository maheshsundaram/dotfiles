# Troubleshooting Deno LSP Integration

## Issue: "Deno is undefined" Error

If you're seeing "Deno is undefined" errors in your editor despite having the Deno LSP server properly installed and running, here are some potential causes and solutions:

### 1. Missing Deno Configuration File

The most common cause is that your project needs a `deno.json` or `deno.jsonc` file in the root directory to:
- Signal to the LSP that this is a Deno project
- Configure Deno's behavior
- Define import maps and other settings

Create a basic `deno.json` file in your project root:

```json
{
  "tasks": {
    "dev": "deno run --watch main.ts"
  },
  "compilerOptions": {
    "lib": ["dom", "dom.iterable", "dom.asynciterable", "deno.ns"]
  }
}
```

The critical part is including `"deno.ns"` in the lib array, which enables Deno namespace types.

### 2. TypeScript Configuration Issues

If you have both `tsconfig.json` and `deno.json`, they might conflict. Make sure your TypeScript configuration is compatible with Deno:

- In `deno.json`, ensure you have the proper compiler options
- Remove any conflicting `tsconfig.json` or ensure it's Deno-compatible

### 3. Import Map Configuration

If you're using import maps, ensure they're properly configured in your `deno.json`:

```json
{
  "imports": {
    "/": "./",
    "./": "./"
  }
}
```

### 4. LSP Configuration Conflicts

The Deno LSP might be conflicting with other TypeScript/JavaScript LSPs:

1. Check if both `denols` and `tsserver` are active on the same files
2. Ensure the LSP priority is set correctly in your Neovim config
3. Verify the file detection patterns in your LSP setup

### 5. Triple-Slash References

For immediate file-level fixes, you can add a triple-slash reference:

```typescript
/// <reference lib="deno.ns" />

// Now Deno namespace should be recognized
console.log(Deno.version);
```

### 6. Debugging LSP Communication

To debug LSP communication:

```lua
-- Add this to your init.lua temporarily
vim.lsp.set_log_level("debug")
```

Then check the logs:
```bash
:lua vim.cmd('e'..vim.lsp.get_log_path())
```

### 7. Restart LSP Server

Sometimes simply restarting the LSP server can fix the issue:

```
:LspRestart denols
```

### 8. Check Deno Installation

Ensure your Deno installation is up-to-date:

```bash
deno upgrade
```

Current version should be 2.0.5 or newer.

## Next Steps

If you've tried these solutions and still have issues:
1. Check if the problem is specific to certain files or the entire project
2. Verify that the Deno LSP is actually attaching to the correct files (`:LspInfo`)
3. Consider temporarily disabling other JavaScript/TypeScript language servers to isolate the issue
