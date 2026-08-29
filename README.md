# GODDESS ANTI-CHEAT (GAC)

**Version 1.0.0**
*All-In-One FiveM Security System & Resource Guard*

---

## 📌 Installation Guide

1. Ensure prerequisites are installed and running:
   - `ox_lib`
   - `oxmysql`
   - `es_extended` (ESX Legacy)

2. Import `goddess_ac.sql` into your database.

3. Place `goddess_ac` into your `resources/` folder.

4. Add permissions to `server.cfg`:
   ```cfg
   add_ace group.admin goddess.admin allow
   add_ace group.admin goddess.security allow
   ensure goddess_ac
