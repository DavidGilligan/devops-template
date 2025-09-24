import time
import types
import importlib

def test_app_imports():
    # Can import the app module without side effects
    mod = importlib.import_module("main")
    assert isinstance(mod, types.ModuleType)

def test_work_runs_once(monkeypatch):
    # Speed up the test by stubbing sleep
    import main

    called = {"slept": False}
    def fast_sleep(_):
        called["slept"] = True

    monkeypatch.setattr(time, "sleep", fast_sleep)
    main.work()
    assert called["slept"] is True
