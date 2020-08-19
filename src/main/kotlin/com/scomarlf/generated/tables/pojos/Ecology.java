/*
 * This file is generated by jOOQ.
 */
package com.scomarlf.generated.tables.pojos;


import com.scomarlf.generated.tables.interfaces.IEcology;


/**
 * This class is generated by jOOQ.
 */
@SuppressWarnings({ "all", "unchecked", "rawtypes" })
public class Ecology implements IEcology {

    private static final long serialVersionUID = 596950316;

    private String id;
    private Long   chatid;
    private String username;
    private String description;

    public Ecology() {}

    public Ecology(IEcology value) {
        this.id = value.getId();
        this.chatid = value.getChatid();
        this.username = value.getUsername();
        this.description = value.getDescription();
    }

    public Ecology(
        String id,
        Long   chatid,
        String username,
        String description
    ) {
        this.id = id;
        this.chatid = chatid;
        this.username = username;
        this.description = description;
    }

    @Override
    public String getId() {
        return this.id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    @Override
    public Long getChatid() {
        return this.chatid;
    }

    @Override
    public void setChatid(Long chatid) {
        this.chatid = chatid;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

    @Override
    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String getDescription() {
        return this.description;
    }

    @Override
    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("Ecology (");

        sb.append(id);
        sb.append(", ").append(chatid);
        sb.append(", ").append(username);
        sb.append(", ").append(description);

        sb.append(")");
        return sb.toString();
    }

    // -------------------------------------------------------------------------
    // FROM and INTO
    // -------------------------------------------------------------------------

    @Override
    public void from(IEcology from) {
        setId(from.getId());
        setChatid(from.getChatid());
        setUsername(from.getUsername());
        setDescription(from.getDescription());
    }

    @Override
    public <E extends IEcology> E into(E into) {
        into.from(this);
        return into;
    }
}