<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "inv_detail".
 *
 * @property int $id
 * @property int $id_master
 * @property int $id_prod
 * @property int $cnt
 * @property string $observacion
 *
 * @property Productos $prod
 * @property InvMaster $master
 */
class InvDetail extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'inv_detail';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_master', 'id_prod', 'cnt'], 'integer'],
            [['observacion'], 'string', 'max' => 45],
            [['id_prod'], 'exist', 'skipOnError' => true, 'targetClass' => Productos::className(), 'targetAttribute' => ['id_prod' => 'id']],
            [['id_master'], 'exist', 'skipOnError' => true, 'targetClass' => InvMaster::className(), 'targetAttribute' => ['id_master' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_master' => 'Id Master',
            'id_prod' => 'Id Prod',
            'cnt' => 'Cnt',
            'observacion' => 'Observacion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProd()
    {
        return $this->hasOne(Productos::className(), ['id' => 'id_prod']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMaster()
    {
        return $this->hasOne(InvMaster::className(), ['id' => 'id_master']);
    }
}
