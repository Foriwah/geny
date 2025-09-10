TECH_NOTES.md

## Architecture

This mini-app follows **Clean Architecture** to ensure separation of concerns, testability, and scalability. The code is split into:

- `domain/` – Business logic, use cases, and abstract repository
- `data/` – Models, data sources (Dio + local assets), and repository implementations
- `presentation/` – UI (screens/widgets) and state management (Provider)

Data flow:

UI -> Provider -> Use case -> Repository (Domain) → RemoteDataSource (Data Layer)

---

## Networking

- **Dio** is used to simulate HTTP requests, even though the data is local.
- A **Dio interceptor** intercepts `/businesses` requests and serves static JSON from `assets/data/businesses.json`.

---

## State Management

- `Provider` is used to manage UI state, including:
  - `loading`
  - `loaded`
  - `empty`
  - `error` + retry

---

## Data Normalization

The original JSON keys (`biz_name`, `bss_location`, `contct_no`) were normalized into clean domain models using `BusinessEntity`.

---

## 🔜 If I Had More Time

- ✅ Implement **pagination** for large business lists
- ✅ Add **local caching** u
- ✅ Integrate **search/filter** functionality
- ✅ Improve error handling with custom exceptions and retry strategies

---

## Trade-offs

- Simulated API via Dio is a workaround to match requirements — in production, this would point to a real REST endpoint.
- No `Either`/`Result` types for error handling to keep things lightweight.

---
