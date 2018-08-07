package com.jk.model;

public class RoleQuanxian {
    private Integer rid;
    private Integer qid;

    @Override
    public String toString() {
        return "RoleQuanxian{" +
                "rid=" + rid +
                ", qid=" + qid +
                '}';
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }
}
