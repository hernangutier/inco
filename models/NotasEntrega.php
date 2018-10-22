<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "notas_entrega".
 *
 * @property int $id
 * @property int $ncontrol
 * @property int $id_client
 * @property string $fecha
 * @property string $motivo
 * @property int $status
 *
 * @property Clientes $client
 * @property NotasEntregaDetail[] $notasEntregaDetails
 */
class NotasEntrega extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'notas_entrega';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_client', 'fecha', 'motivo'], 'required'],
            [['id_client', 'status','ncontrol'], 'integer'],
            [['fecha'], 'safe'],
            [['motivo'], 'string', 'max' => 400],
            [['id_client'], 'exist', 'skipOnError' => true, 'targetClass' => Clientes::className(), 'targetAttribute' => ['id_client' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_client' => 'Cliente',
            'fecha' => 'Fecha',
            'motivo' => 'Motivo',
            'status' => 'Status',
            'ncontrol'=>'N° de Control',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClient()
    {
        return $this->hasOne(Clientes::className(), ['id' => 'id_client']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNotasEntregaDetails()
    {
        return $this->hasMany(NotasEntregaDetail::className(), ['id_not' => 'id']);
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
