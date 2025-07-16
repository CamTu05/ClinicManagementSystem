package DTO;

import java.sql.Timestamp;
import java.util.Vector;

public class PrescriptionDTO {

    private int       id;       
    private Timestamp createdAt; 

    private Vector<MedicineItem> medicines = new Vector<>();

    public static class MedicineItem {
        private String medicineName;
        private int    quantity;
        private String usage;       

        public MedicineItem() {}
        public MedicineItem(String name,int qty,String usage){
            this.medicineName = name;
            this.quantity     = qty;
            this.usage        = usage;
        }

        public String getMedicineName(){ return medicineName; }
        public void setMedicineName(String n){ this.medicineName = n; }

        public int getQuantity(){ return quantity; }
        public void setQuantity(int q){ this.quantity = q; }

        public String getUsage(){ return usage; }
        public void setUsage(String u){ this.usage = u; }

        @Override public String toString(){
            return medicineName + " × " + quantity + " (" + usage + ")";
        }
    }

    public int getId()                   { return id; }
    public void setId(int id)            { this.id = id; }

    public Timestamp getCreatedAt()      { return createdAt; }
    public void setCreatedAt(Timestamp t){ this.createdAt = t; }

    public Vector<MedicineItem> getMedicines() { return medicines; }

    @Override public String toString(){
        StringBuilder sb = new StringBuilder("Prescription ")
            .append(id).append(" (").append(createdAt).append(")\n");
        for(MedicineItem m : medicines) sb.append("  - ").append(m).append('\n');
        return sb.toString();
    }
}
