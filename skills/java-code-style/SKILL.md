---
name: java-code-style
description: "Use when writing, editing, or reviewing Java code. Enforces concise Java style: use var when the type is implicit, keep explicit types when they improve clarity, prefer final, respect SOLID, simple methods, and relevant non-generic names."
---

# Java Code Style

Use this skill when creating, editing, or reviewing Java code.

## Type Declarations

- Use `var` when the type is obvious from the right-hand side.
- Keep explicit types when they improve readability or reveal important domain meaning.
- Do not use `var` if it hides the real type behind a factory, interface, or ambiguous method call.
- Prefer explicit method return types and field types.

Good:

```java
final var invoice = invoiceFacade.createInvoice(command);
final var order = orderService.findOrder(orderId);
```

Prefer explicit:

```java
OrderRestClient orderRestClient = new HttpOrderRestClient();
Map<String, Order> orders = loadOrders();
```

## Immutability

- Use `final` as much as practical for local variables, fields, and parameters.
- Prefer immutable data structures and records for simple data carriers.
- Avoid mutable shared state unless there is a concrete need.

## Design

- Respect SOLID principles pragmatically.
- Keep methods small and focused on one responsibility.
- Keep classes cohesive; do not mix unrelated business responsibilities.
- Prefer dependency boundaries that reflect the domain.
- Avoid premature abstractions, but extract an interface when it expresses a real boundary.

## Naming

- Use relevant domain names.
- Avoid generic or ambiguous names for variables, methods, and classes.
- Avoid names like `data`, `item`, `manager`, `helper`, `processor`, `service` unless the domain makes them precise.
- Prefer names that explain business intent, for example `invoiceFacade`, `orderRestClient`, `capturedTrace`, `taxAmount`.

## Method Style

- Keep methods simple and readable.
- Prefer early validation over deeply nested branches.
- Avoid long parameter lists; use records or request objects when parameters belong together.
- Avoid comments that repeat the code. Add comments only for non-obvious business or technical decisions.

## Review Checklist

- Types are explicit where clarity matters and `var` is used only when obvious.
- `final` is used where practical.
- Method and class names are domain-specific.
- Methods are short and focused.
- Responsibilities are separated cleanly.
- No generic names hide business intent.
