## Make Dependencies Explicit and Visible

See [here](https://ncrcoe.gitbooks.io/java-for-small-teams/content/style/80_make_dependencies_explicit.html) for the original guide - the principals are sound, we however value readability and usability and it shows in a couple places:

* Prefer Field injections over Constructor/Setter injections as we value readablity more.
* Use `Singletons`, `ThreadLocals`, `static` and `new` judiciously.
* Never use ***** imports
* Assume database, authentication and request hidden dependencies (when appplicable) e.g. 

```java
Kernel.get(User.class);
Kernel.get(Session.class);
Kernel.get(HttpServletRequest.class)
Kernel.get(DbManager.class)
Tx.exec()
```