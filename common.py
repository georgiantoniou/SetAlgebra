class Configuration:
    def __init__(self, adict):
        self.__dict__.update(adict)
    def set(self, key, value):
        self.__dict__[key] = value
    def shortname(self):
        l = []
        if hasattr(self, 'setalgebra_freq'):
            l.append("freq={}".format(self.setalgebra_freq))
        l.append("qps={}".format(self.setalgebra_qps))
        return '-'.join(l)
