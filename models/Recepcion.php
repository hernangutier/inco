<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "recepcion".
 *
 * @property int $id
 * @property string $nfact
 * @property int $id_prov
 * @property string $date_creation
 * @property string $date_recive
 * @property string $observaciones
 * @property int $status
 * @property string $observaciones
 * @property int $is_incidencia
  * @property int $ncontrol
 *
 * @property Proveedores $prov
 */
class Recepcion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'recepcion';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_prov', 'status','is_incidencia'], 'integer'],
            [['date_creation', 'date_recive'], 'safe'],
            [['observaciones'], 'string', 'max' => 400],
            [['date_recive'], 'required'],
            [['nfact'], 'string', 'max' => 20],
            [['id_prov'], 'exist', 'skipOnError' => true, 'targetClass' => Proveedores::className(), 'targetAttribute' => ['id_prov' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nfact' => 'N° de Factura',
            'id_prov' => 'Proveedor',
            'date_creation' => 'Date Creation',
            'date_recive' => 'Fecha de Recepción',
            'observaciones' => 'Observaciones',
            'status' => 'Status',
            'is_incidencia' => 'Reporta Incidencia',
            'ncontrol' => 'N° de Control',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProv()
    {
        return $this->hasOne(Proveedores::className(), ['id' => 'id_prov']);
    }


    public function getIncidenciaHtml(){
    if ($this->is_incidencia==0){
      return '<span class="badge badge-danger"><b>No</b></span>';
    }

    if ($this->is_incidencia==1){
      return '<span class="badge badge-success">Si</span>';
    }



  }

  public function getStatusHtml(){
      if ($this->status==0){
        return '<span class="badge badge-warning"><b>Pendiente</b></span>';
      }

      if ($this->status==1){
        return '<span class="badge badge-success">Procesado</span>';
      }

      if ($this->status==2){
        return '<span class="badge badge-danger">Anulado</span>';
      }

    }

  public function getNControlFormat()
  {
      return str_pad($this->ncontrol,10,'0',STR_PAD_LEFT);
  }


}
